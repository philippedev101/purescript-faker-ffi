import { faker } from "@faker-js/faker";

export const columnImpl = () => faker.database.column();

export const typeImpl = () => faker.database.type();

export const collationImpl = () => faker.database.collation();

export const engineImpl = () => faker.database.engine();

export const mongodbObjectIdImpl = () => faker.database.mongodbObjectId();
