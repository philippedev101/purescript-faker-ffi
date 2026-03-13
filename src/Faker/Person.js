import { faker } from "@faker-js/faker";

export const firstNameImpl = () => faker.person.firstName();

export const firstNameWithSexImpl = (sex) => () => faker.person.firstName(sex);

export const lastNameImpl = () => faker.person.lastName();

export const lastNameWithSexImpl = (sex) => () => faker.person.lastName(sex);

export const middleNameImpl = () => faker.person.middleName();

export const middleNameWithSexImpl = (sex) => () => faker.person.middleName(sex);

export const fullNameImpl = () => faker.person.fullName();

export const fullNameOptsImpl = (opts) => () => faker.person.fullName(opts);

export const genderImpl = () => faker.person.gender();

export const sexImpl = () => faker.person.sex();

export const sexTypeImpl = () => faker.person.sexType();

export const bioImpl = () => faker.person.bio();

export const prefixImpl = () => faker.person.prefix();

export const prefixWithSexImpl = (sex) => () => faker.person.prefix(sex);

export const suffixImpl = () => faker.person.suffix();

export const jobTitleImpl = () => faker.person.jobTitle();

export const jobDescriptorImpl = () => faker.person.jobDescriptor();

export const jobAreaImpl = () => faker.person.jobArea();

export const jobTypeImpl = () => faker.person.jobType();

export const zodiacSignImpl = () => faker.person.zodiacSign();
