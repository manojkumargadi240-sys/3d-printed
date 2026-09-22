# LayerLab setup

This project uses a public storefront and a private owner studio.

## Required Supabase setup

1. Open your Supabase project.
2. Go to Authentication > Providers > GitHub.
3. Enable GitHub authentication.
4. Set the callback URL to:
   https://fmcqnllutxfrgswnqand.supabase.co/auth/v1/callback
5. Set the site URL to:
   https://manojkumargadi240-sys.github.io/3d-printed/
6. Add the redirect URL if required:
   https://manojkumargadi240-sys.github.io/3d-printed/

## Database schema

Run the SQL in `supabase/schema.sql` in the Supabase SQL editor.

This creates:
- the `public.products` table
- public read access for the storefront
- owner-only write access for `manojkumargadi240@gmail.com`
- row-level security for product management

## Frontend notes

The website is configured with the public Supabase anon key and the owner email guard.

Owner access is allowed only when the signed-in GitHub email matches:
- manojkumargadi240@gmail.com

## Important

- Do not expose the Supabase service role key in the browser.
- Do not commit private secrets to GitHub.
- Keep the GitHub OAuth client secret in the Supabase provider settings only.

## Local test

Open the site and sign in with GitHub using the owner email. The private owner panel will appear. Customers will only see the storefront.
