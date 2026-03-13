import { faker } from "@faker-js/faker";

export const booleanImpl = () => faker.datatype.boolean();

export const booleanWithProbabilityImpl = (probability) => () =>
  faker.datatype.boolean({ probability });
