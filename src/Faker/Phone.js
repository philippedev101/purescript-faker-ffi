import { faker } from "@faker-js/faker";

export const phoneNumberImpl = () => faker.phone.number();

export const phoneNumberWithStyleImpl = (style) => () => faker.phone.number({ style });

export const imeiImpl = () => faker.phone.imei();
