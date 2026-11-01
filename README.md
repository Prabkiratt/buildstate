# Buildestate

A responsive, frontend-only real estate website for an academic project. Built with HTML, CSS and vanilla JavaScript. No dependencies, database, API keys, or backend required.

## Four pages

1. Home — property search, featured homes and neighbourhoods.
2. Properties — six sample listings, location/type/buy-or-rent/budget filters, sorting, saved homes and property detail dialogs.
3. About & Contact — project introduction and validated demo enquiry form.
4. Login — create account, log in, demo account, profile and logout.

## Run locally

Requires Node.js 18 or later.

```sh
npm run dev
```

Open http://127.0.0.1:3000. No npm install is necessary. For a quick look, index.html also opens directly, but browser account creation requires localhost or HTTPS.

```sh
npm run check
npm run build
```

## Deploy to Vercel

1. Unzip this project and upload its contents to a GitHub repository, with package.json at the repository root.
2. In Vercel choose Add New → Project and import that repository.
3. Framework preset: **Other**. Build command: **npm run build**. Output directory: **dist**. No environment variables are needed.
4. Deploy. The included vercel.json configures these build settings and clean URLs.

Alternatively, from the project directory use the official Vercel CLI (`npx vercel`) and follow its prompts. Deployment has intentionally been left to the student.

## Try the project

- Home: choose Model Town and Independent house, then Find a home.
- Properties: try rent, change a budget, sort, save a home with the heart, and select Saved homes.
- Open View home, then Enquire about this home. The contact form is prefilled.
- Login: select Create account and enter made-up details with an 8+ character password. Log out, then log in with the same details.
- Explore demo account works without registration. Accounts, saved properties and enquiries persist only in the same browser and origin.

## Frontend demo scope

Login is a learning demonstration, not secure authentication. A SHA-256 password digest and account metadata are stored in localStorage. Do not use real passwords or personal information. There is no server-side access control, cross-device login, or password recovery. Saved homes belong to the current browser, not separate accounts. The enquiry form saves the latest demo enquiry locally; it sends no email and makes no real appointment.

Listings, names, prices and locations are fictional examples, not real property offers. The 15 house photos were supplied by the user and are bundled locally in assets/houses. They do not verify the illustrative listing addresses. The website does not claim to be an operating agency.

## Photos and changing content

All 15 original user-supplied house photographs are included in assets/houses/home-01.jpg through home-15.jpg. The homepage uses a three-photo hero; listing cards and detail dialogs use local house photos; the About page includes a gallery of all 15 photos; the login page also uses a supplied house photo. No stock photos or remote image services are required.

Photos are copied to dist/assets/houses by npm run build, ready for Vercel. The only optional external design resource is Google Fonts; system fonts work offline.

Listing image paths are defined at the top of app.js. Other image paths are in index.html, about.html and login.html. Replace a local photo file or update these paths to change it.

Source syntax, automated behaviour checks, photo decoding and build output references were verified. Browser visual preview remains unavailable because the environment blocks loopback access.

## Topic sheet entry

Project name: **Buildestate**

Project topic: **Buildestate — A Frontend Real Estate Website for Browsing, Filtering and Shortlisting Homes**

Student name: [enter your brother’s full name]

Roll number: [enter his correct roll number]

Platform: **Vercel**

The announcement says to fill the sheet by 2:30 PM the next day. Submit the correct student details before the teacher's deadline. No sheet was submitted by this project.
