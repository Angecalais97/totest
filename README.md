# DevSecOps Project – `totest`

##  Project Context

This repository (`totest`) is intentionally **simple**. It contains only:

* `index.html`

* `style.css`

There is **no backend**, **no API**, **no framework**.

👉 The goal of this project is **not complexity**.
👉 The goal is to demonstrate **real DevSecOps thinking applied to a real, minimal codebase**.

This project is designed as a **DevSecOps portfolio and teaching reference**.

---

## 🎯 Learning Objectives

By completing this project, you will learn how to:

* Design a **complete DevSecOps CI/CD pipeline** from scratch
* **Write your own GitHub Actions workflows** (no pre-written workflows provided)
* **Create your own Dockerfile** adapted to a static website
* Adapt security tools **to the real project**, not the opposite
* Add security and quality gates
* Centralize security results on GitHub
* Deploy safely using GitHub Actions

> 🔑 **Key message**: DevSecOps is about *rigor and consistency*, not project size.

---

## 🧱 Target DevSecOps Architecture (Student‑Built)

🔐 **Security Principle – Least Privilege (Mandatory)**

Students **must apply the principle of Least Privilege** when designing their CI/CD pipeline.

This means:

* The pipeline must start with **read-only permissions**
* Elevated permissions (write/deploy) must be granted **only when strictly required**
* Permissions must be scoped **per job or per step**, not globally

> ⚠️ A pipeline that works but violates least privilege is considered **incorrect**.

## 🧱 Target DevSecOps Architecture

⚠️ **Important**: This architecture must be implemented by students.

* No workflow files are provided
* No Dockerfile is provided
* All CI/CD logic must be written by the student

The diagram below represents the **target state**, not the starting point.

## 🧱 Target DevSecOps Architecture

```
Source Code (HTML / CSS)
   ↓
Gitleaks – Secret Detection
   ↓
HTML / CSS Validation Tests
   ↓
SonarQube – Static Code Analysis
   ↓
Docker – Containerization (NGINX)
   ↓
Trivy – Filesystem & Image Security Scan
   ↓
GitHub Pages – Deployment
```

---

## 🔐 Step 1 – Secret Scanning with Gitleaks (Student Task)

### Student responsibility

* Research Gitleaks
* Integrate it into a GitHub Actions workflow
* Decide where it runs in the pipeline
* Ensure the pipeline **fails on secret detection**

### Why this tool?

### Why this tool?

Even simple repositories can accidentally contain:

* API keys
* tokens
* passwords

**Gitleaks** prevents secrets from ever reaching production.

### What it does

* Scans the entire repository
* Fails the pipeline if a secret is detected

### Why it matters

> Secrets leaks are one of the **most common real-world security incidents**.

---

## 🧪 Step 2 – Tests Adapted to a Static Project (Student Task)

### Student responsibility

* Choose appropriate HTML/CSS validation tools
* Integrate them into the CI pipeline
* Ensure the pipeline fails on invalid HTML or CSS

### Important principle

### Important principle

❌ Do **not** use Jest, PHPUnit, or backend tools here.

### Why?

This repository contains only **HTML and CSS**.

### Correct approach

Use tools adapted to the code:

* HTML validation (structure & syntax)
* CSS validation (syntax & consistency)

### Why this matters

> A DevOps engineer chooses tools based on the **project context**, not trends.

---

## 📊 Step 3 – Static Code Analysis with SonarQube (Student Task)

### Student responsibility

* Understand how SonarQube analyzes frontend code
* Configure analysis for HTML/CSS only
* Enforce a Quality Gate in the pipeline

### Why SonarQube for HTML/CSS?

### Why SonarQube for HTML/CSS?

SonarQube can detect:

* bad practices
* maintainability issues
* duplicated code
* basic security issues (e.g. XSS risks)

### What students must configure

* Frontend-only analysis
* Quality Gate enforcement

### Why this matters

> Quality gates prevent **technical debt** from entering production.

---

## 🐳 Step 4 – Containerization with Docker (Student Task)

### Student responsibility

* Write a Dockerfile from scratch
* Choose an appropriate base image
* Ensure the container serves the static website correctly

### Why Docker for a static website?

### Why Docker for a static website?

* Industry standard
* Reproducible environment
* Validation before deployment

### Implementation

* Base image: `nginx:alpine`
* Serve `index.html` and `style.css`

### Key learning

> Docker is not only for microservices — it is a **standard delivery unit**.

---

## 🔎 Step 5 – Security Scanning with Trivy (Student Task)

### Student responsibility

* Integrate Trivy into the CI pipeline
* Perform both filesystem and image scans
* Define a failure policy based on severity

### Filesystem Scan

### Filesystem Scan

* Scans the repository before Docker build
* Detects sensitive files and known vulnerabilities

### Image Scan

* Scans the final Docker image
* Detects CVEs in NGINX and Alpine OS

### Security policy

❌ Pipeline fails if **HIGH or CRITICAL** vulnerabilities are found

### Why this matters

> Security must be validated **before deployment**, not after incidents.

---

## 📦 Step 6 – Centralizing Security Results on GitHub (Student Task)

### 🔐 Least Privilege Requirement

When uploading security reports:

* Grant **`security-events: write`** only to the steps that upload SARIF files
* Do **not** grant repository write access globally

Students must be able to **justify every permission used** in the workflow.

### Student responsibility

### Student responsibility

* Decide which scan results must be stored
* Publish security results to GitHub Security tab
* Upload reports as workflow artifacts

### GitHub Security Tab

### GitHub Security Tab

* SARIF reports uploaded automatically
* Historical view per commit

### GitHub Actions Artifacts

* Downloadable JSON and SARIF reports
* Audit and traceability support

### Why this matters

> Real companies require **evidence**, not assumptions.

---

## 🚀 Step 7 – Deployment with GitHub Pages (Student Task)

### 🔐 Least Privilege Requirement

Deployment must respect **least privilege**:

* `contents: write` is allowed **only for the deployment step**
* All previous steps must run with **read-only permissions**

> 🔎 Any unnecessary permission is considered a **security flaw**.

### Student responsibility

### Student responsibility

* Configure GitHub Pages
* Ensure deployment happens **only after all checks pass**
* Understand why deployment must be the final step

### Why GitHub Pages?

### Why GitHub Pages?

* Perfect for static projects
* Free and integrated with GitHub
* Ideal for CI/CD learning

### Deployment conditions

✔ Secrets scan passed
✔ Tests passed
✔ SonarQube Quality Gate passed
✔ Trivy scans passed

---

## 🏆 Skills Demonstrated by This Project

By completing this project **without pre-written workflows or Dockerfiles and while respecting Least Privilege**, students demonstrate:

By completing this project **without pre-written workflows or Dockerfiles**, students demonstrate:

By completing this project, students demonstrate:

* DevSecOps mindset
* Tool-to-context adaptation
* CI/CD pipeline design
* Security-by-design
* Audit-ready practices
* Professional GitHub usage

---

## 🗣️ How to Explain This Project in an Interview

> “Starting from a simple HTML/CSS project, I designed a complete DevSecOps pipeline with secret scanning, static analysis, containerization, vulnerability scanning, and automated deployment. All security results are centralized on GitHub to ensure traceability and audit readiness.”

---

## 🎓 Final Message to Students

> **DevSecOps excellence is not about complexity.**
> **It is about discipline, coherence, and security at every step.**

---

📌 This repository is intentionally minimal to focus on professional DevSecOps practices.

---

## 🔗 Official Documentation Links (Mandatory Reading)

Students are **required to consult the official documentation** of each tool used in this project. All design and implementation decisions must be based on these sources.

### 🔐 Gitleaks (Secret Scanning)

* GitHub repository: [https://github.com/gitleaks/gitleaks](https://github.com/gitleaks/gitleaks)
* Official documentation: [https://gitleaks.io/](https://gitleaks.io/)

**Why read it?**
To understand detection rules, configuration files, exit codes, and CI integration.

---

### 🧪 HTML & CSS Validation Tools

#### HTMLHint

* Documentation: [https://htmlhint.com/docs/user-guide/](https://htmlhint.com/docs/user-guide/)

#### Stylelint

* Documentation: [https://stylelint.io/user-guide/](https://stylelint.io/user-guide/)

**Why read them?**
To correctly validate syntax, define rules, and fail the pipeline when standards are violated.

---

### 📊 SonarQube (Static Code Analysis)

* Main documentation: [https://docs.sonarsource.com/sonarqube/](https://docs.sonarsource.com/sonarqube/)
* HTML analysis: [https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/languages/html/](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/languages/html/)

**Why read it?**
To configure frontend-only analysis, quality gates, and understand reported issues.

---

### 🐳 Docker (Containerization)

* Dockerfile reference: [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)
* Docker best practices: [https://docs.docker.com/develop/dev-best-practices/](https://docs.docker.com/develop/dev-best-practices/)

**Why read it?**
To write a correct Dockerfile, choose minimal images, and apply security best practices.

---

### 🔎 Trivy (Security Scanning)

* Official documentation: [https://aquasecurity.github.io/trivy/](https://aquasecurity.github.io/trivy/)
* GitHub repository: [https://github.com/aquasecurity/trivy](https://github.com/aquasecurity/trivy)

**Why read it?**
To understand filesystem vs image scans, severity levels, SARIF output, and CI failure policies.

---

### ⚙️ GitHub Actions (CI/CD & Permissions)

* GitHub Actions documentation: [https://docs.github.com/en/actions](https://docs.github.com/en/actions)
* Security & permissions: [https://docs.github.com/en/actions/security-guides/automatic-token-authentication](https://docs.github.com/en/actions/security-guides/automatic-token-authentication)

**Why read it?**
To correctly design workflows, apply least privilege, and manage permissions securely.

---

### 🚀 GitHub Pages (Deployment)

* Official documentation: [https://docs.github.com/en/pages](https://docs.github.com/en/pages)

**Why read it?**
To understand how static sites are deployed, hosted, and secured using GitHub Pages.

---

> ⚠️ **Important rule**: Any student unable to justify a tool configuration using the official documentation is considered **not ready for production DevSecOps work**.

# Carles
