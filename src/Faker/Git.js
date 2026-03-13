import { faker } from "@faker-js/faker";

export const branchImpl = () => faker.git.branch();

export const commitMessageImpl = () => faker.git.commitMessage();

export const commitShaImpl = () => faker.git.commitSha();

export const commitShaNImpl = (length) => () => faker.git.commitSha({ length });

export const commitEntryImpl = () => faker.git.commitEntry();

export const commitEntryOptsImpl = (opts) => () => faker.git.commitEntry(opts);

export const commitDateImpl = () => faker.git.commitDate();
