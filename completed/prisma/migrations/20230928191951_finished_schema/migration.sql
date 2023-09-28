/*
  Warnings:

  - You are about to drop the column `teacherId` on the `User` table. All the data in the column will be lost.
  - Added the required column `userProfileId` to the `Artist` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "artistProfileId" INTEGER,
    "successorId" INTEGER,
    "favoriteUserId" INTEGER,
    CONSTRAINT "User_successorId_fkey" FOREIGN KEY ("successorId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "User_favoriteUserId_fkey" FOREIGN KEY ("favoriteUserId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_User" ("email", "id", "name", "successorId") SELECT "email", "id", "name", "successorId" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE UNIQUE INDEX "User_successorId_key" ON "User"("successorId");
CREATE TABLE "new_Artist" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "userProfileId" INTEGER NOT NULL,
    CONSTRAINT "Artist_userProfileId_fkey" FOREIGN KEY ("userProfileId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Artist" ("id", "name") SELECT "id", "name" FROM "Artist";
DROP TABLE "Artist";
ALTER TABLE "new_Artist" RENAME TO "Artist";
CREATE UNIQUE INDEX "Artist_userProfileId_key" ON "Artist"("userProfileId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
