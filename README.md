# 3d-printed

Website: https://dainty-phoenix-977f80.netlify.app

This project is configured as a public storefront with a restricted owner studio.

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

Run the SQL in `supabase/schema.sql` to create the `products` table and owner-only write rules.

Run the SQL in `supabase/orders-schema.sql` to create the `orders` table and owner-only tracking.

Run the SQL in `supabase/storage-schema.sql` to create storage policies for the `product-images` bucket.

## Storage bucket

In Supabase Storage:
- create a bucket named `product-images`
- set it to Public: true
- allowed MIME types: image/jpeg, image/png, image/webp, image/gif

## Owner login rule

The frontend only allows owner access when the signed-in GitHub email matches:
- manojkumargadi240@gmail.com

## Debug / demo

If the database is not yet available, the app falls back to local browser storage so the storefront still works in preview mode.

## Important

- Do not expose the Supabase service role key in browser code.
- Do not commit secrets to GitHub.
- Keep the GitHub client secret in Supabase only.

