import { faker } from "@faker-js/faker";

export const airportImpl = () => {
  const a = faker.airline.airport();
  return { name: a.name, iataCode: a.iataCode };
};

export const airlineImpl = () => {
  const a = faker.airline.airline();
  return { name: a.name, iataCode: a.iataCode };
};

export const airplaneImpl = () => {
  const a = faker.airline.airplane();
  return { name: a.name, iataTypeCode: a.iataTypeCode };
};

export const recordLocatorImpl = () => faker.airline.recordLocator();

export const recordLocatorOptsImpl = (opts) => () =>
  faker.airline.recordLocator(opts);

export const seatImpl = () => faker.airline.seat();

export const seatOptsImpl = (opts) => () => faker.airline.seat(opts);

export const aircraftTypeImpl = () => faker.airline.aircraftType();

export const flightNumberImpl = () => faker.airline.flightNumber();

export const flightNumberOptsImpl = (opts) => () =>
  faker.airline.flightNumber(opts);
