--Criação do banco de dados 
CREATE DATABASE "dribank";

--TABLE states
CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL
);


--TABLE cities
CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(80) NOT NULL,
	"stateId" INTEGER REFERENCES states(id)
);


--TABLE customerAddresses
CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES customers(id),
  "street" VARCHAR(50) NOT NULL,
  "number" VARCHAR(20) NOT NULL,
  "complement" VARCHAR(20) NOT NULL,
  "postalCode" VARCHAR(20) NOT NULL,
  "cityId" INTEGER REFERENCES cities(id)
);


--TABLE customerPhones
CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES custumers(id) custumerAdresses(customerId),
  "number" VARCHAR(20) NOT NULL,
  "type" VARCHAR(20) NOT NULL,
);


--TABLE customers
CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY REFERENCES customerPhones(customerId) custumerAdresses(customerId),
	"fullName" VARCHAR(50) NOT NULL,
  "cpf" VARCHAR(11) NOT NULL UNIQUE,
  "email" VARCHAR (80) NOT NULL UNIQUE,
  "password" TEXT NOT NULL
);

--TABLE bankAccount
CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL,
	"accountNumber" VARCHAR(50) NOT NULL,
  "agency" VARCHAR(5) NOT NULL,
  "openDate" timestamp NOT NULL DEFAULT NOW(),
  "closeDate" timestamp NOT NULL DEFAULT
);

--TABLE transactions
CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL,
	"amount" VARCHAR(50) NOT NULL,
  "type" VARCHAR(20) NOT NULL,
  "time" VARCHAR(20) NOT NULL,
  "description" TEXT NOT NULL,
  "cancelled"  timestamp NOT NULL DEFAULT
);


--TABLE creditCards
CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL,
	"name" VARCHAR(50) NOT NULL,
  "number" VARCHAR(20) NOT NULL,
  "securityCode" VARCHAR(20) NOT NULL,
  "expirationMonth" INTEGER NOT NULL,
  "expirationYear" INTEGER NOT NULL
  "password" TEXT NOT NULL,
  "liimit" INTEGER NOT NULL
  );