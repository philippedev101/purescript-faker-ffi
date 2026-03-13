import { faker } from "@faker-js/faker";

export const seedImpl = (n) => () => {
  faker.seed(n);
};
