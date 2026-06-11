const { existsSync, mkdirSync, rmSync } = require("fs");
const { dirname, join } = require("path");
const { spawn } = require("child_process");

const isCloudFoundry = Boolean(process.env.VCAP_APPLICATION);
const dbUrl = process.env.SQLITE_DB_URL || (isCloudFoundry
  ? "/home/vcap/tmp/innovation-portfolio-studio.sqlite"
  : join(process.cwd(), "db.sqlite"));

process.env.CDS_REQUIRES_DB_CREDENTIALS_URL = dbUrl;

function run(command, args, options = {}) {
  return new Promise((resolve, reject) => {
    const child = spawn(command, args, {
      stdio: "inherit",
      shell: process.platform === "win32",
      env: process.env,
      ...options
    });

    child.on("error", reject);
    child.on("exit", (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`${command} ${args.join(" ")} exited with code ${code}`));
      }
    });
  });
}

async function main() {
  mkdirSync(dirname(dbUrl), { recursive: true });

  if (existsSync(dbUrl)) {
    rmSync(dbUrl);
  }

  console.log(`[cf:start] Using SQLite database at ${dbUrl}`);
  console.log("[cf:start] Deploying CAP model and demo data to SQLite");
  await run("npx", ["cds", "deploy", "--to", `sqlite:${dbUrl}`]);

  console.log(`[cf:start] Starting CAP server on port ${process.env.PORT || 4004}`);
  await run("npx", ["cds-serve"]);
}

main().catch((error) => {
  console.error("[cf:start] Startup failed");
  console.error(error);
  process.exit(1);
});
