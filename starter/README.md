# To Get Started

1. Initialize a new package.json using your favorite package manager (npm, pnpm, bun, yarn)
2. Install prisma, @prisma/client, and typescript
3. Initialize typescript
4. Initialize prisma with a SQLite database >npx prisma init --datasource-provider sqlite

# Creating the Schema

In our schema, define the following models for our Spotify clone

1. Users or our app. Users can follow other users and be followed by other users.
2. Artists. Artists have songs and albums, and every artist must be tied to a user profile
3. Albums, which each have a singular artist and many songs
4. Songs, which are tied to exactly one artist and exactly one album

Also feel free to experiment with changing up the relations. For example, you could allow a song to have multiple artists.
