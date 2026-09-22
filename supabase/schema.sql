create extension if not exists pgcrypto;

create table if not exists public.products (
  id text primary key,
  name text not null,
  description text not null,
  price numeric not null default 0,
  image text not null default '',
  category text not null default 'Desk & Tech',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.products enable row level security;

create policy "Public can read products"
on public.products
for select
using (true);

create policy "Owner can insert products"
on public.products
for insert
with check (
  auth.uid() is not null
  and lower(coalesce(auth.jwt()->>'email', '')) = 'manojkumargadi240@gmail.com'
);

create policy "Owner can update products"
on public.products
for update
using (
  auth.uid() is not null
  and lower(coalesce(auth.jwt()->>'email', '')) = 'manojkumargadi240@gmail.com'
)
with check (
  auth.uid() is not null
  and lower(coalesce(auth.jwt()->>'email', '')) = 'manojkumargadi240@gmail.com'
);

create policy "Owner can delete products"
on public.products
for delete
using (
  auth.uid() is not null
  and lower(coalesce(auth.jwt()->>'email', '')) = 'manojkumargadi240@gmail.com'
);

create or replace function public.update_products_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists products_set_updated_at on public.products;
create trigger products_set_updated_at
before update on public.products
for each row
execute function public.update_products_updated_at();

-- Optional: helpful indexes
create index if not exists idx_products_category on public.products(category);
create index if not exists idx_products_created_at on public.products(created_at desc);
