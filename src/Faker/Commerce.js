import { faker } from "@faker-js/faker";

export const departmentImpl = () => faker.commerce.department();

export const productNameImpl = () => faker.commerce.productName();

export const priceImpl = () => faker.commerce.price();

export const priceOptsImpl = (opts) => () => faker.commerce.price(opts);

export const productAdjectiveImpl = () => faker.commerce.productAdjective();

export const productMaterialImpl = () => faker.commerce.productMaterial();

export const productImpl = () => faker.commerce.product();

export const productDescriptionImpl = () => faker.commerce.productDescription();

export const isbnImpl = () => faker.commerce.isbn();

export const isbnOptsImpl = (opts) => () => faker.commerce.isbn(opts);

export const upcImpl = () => faker.commerce.upc();

export const upcOptsImpl = (opts) => () => faker.commerce.upc(opts);
