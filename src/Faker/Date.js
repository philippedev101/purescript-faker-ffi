import { faker } from "@faker-js/faker";

export const anytimeImpl = () => faker.date.anytime().toISOString();

export const pastImpl = () => faker.date.past().toISOString();

export const pastOptsImpl = (opts) => () => faker.date.past({ years: opts.years }).toISOString();

export const futureImpl = () => faker.date.future().toISOString();

export const futureOptsImpl = (opts) => () =>
  faker.date.future({ years: opts.years }).toISOString();

export const betweenImpl = (opts) => () =>
  faker.date.between({ from: opts.from, to: opts.to }).toISOString();

export const betweensImpl = (opts) => () =>
  faker.date.betweens({ from: opts.from, to: opts.to, count: opts.count }).map((d) =>
    d.toISOString()
  );

export const recentImpl = () => faker.date.recent().toISOString();

export const recentOptsImpl = (opts) => () =>
  faker.date.recent({ days: opts.days }).toISOString();

export const soonImpl = () => faker.date.soon().toISOString();

export const soonOptsImpl = (opts) => () =>
  faker.date.soon({ days: opts.days }).toISOString();

export const birthdateImpl = () => faker.date.birthdate().toISOString();

export const birthdateByAgeImpl = (opts) => () =>
  faker.date.birthdate({ min: opts.min, max: opts.max, mode: "age" }).toISOString();

export const birthdateByYearImpl = (opts) => () =>
  faker.date.birthdate({ min: opts.min, max: opts.max, mode: "year" }).toISOString();

export const monthImpl = () => faker.date.month();

export const monthAbbreviatedImpl = () => faker.date.month({ abbreviated: true });

export const weekdayImpl = () => faker.date.weekday();

export const weekdayAbbreviatedImpl = () => faker.date.weekday({ abbreviated: true });

export const timeZoneImpl = () => faker.date.timeZone();
