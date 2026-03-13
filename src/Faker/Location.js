import { faker } from "@faker-js/faker";

export const cityImpl = () => faker.location.city();

export const streetImpl = () => faker.location.street();

export const streetAddressImpl = () => faker.location.streetAddress();

export const streetAddressOptsImpl = (opts) => () => faker.location.streetAddress(opts);

export const buildingNumberImpl = () => faker.location.buildingNumber();

export const secondaryAddressImpl = () => faker.location.secondaryAddress();

export const countyImpl = () => faker.location.county();

export const countryImpl = () => faker.location.country();

export const continentImpl = () => faker.location.continent();

export const countryCodeImpl = () => faker.location.countryCode();

export const countryCodeOptsImpl = (opts) => () => faker.location.countryCode(opts);

export const stateImpl = () => faker.location.state();

export const stateOptsImpl = (opts) => () => faker.location.state(opts);

export const zipCodeImpl = () => faker.location.zipCode();

export const directionImpl = () => faker.location.direction();

export const directionOptsImpl = (opts) => () => faker.location.direction(opts);

export const cardinalDirectionImpl = () => faker.location.cardinalDirection();

export const cardinalDirectionOptsImpl = (opts) => () =>
  faker.location.cardinalDirection(opts);

export const ordinalDirectionImpl = () => faker.location.ordinalDirection();

export const ordinalDirectionOptsImpl = (opts) => () =>
  faker.location.ordinalDirection(opts);

export const timeZoneImpl = () => faker.location.timeZone();

export const latitudeImpl = () => faker.location.latitude();

export const latitudeOptsImpl = (opts) => () => faker.location.latitude(opts);

export const longitudeImpl = () => faker.location.longitude();

export const longitudeOptsImpl = (opts) => () => faker.location.longitude(opts);

export const nearbyGPSCoordinateImpl = () => {
  const result = faker.location.nearbyGPSCoordinate();
  return { latitude: result[0], longitude: result[1] };
};

export const nearbyGPSCoordinateOptsImpl = (opts) => () => {
  const result = faker.location.nearbyGPSCoordinate(opts);
  return { latitude: result[0], longitude: result[1] };
};

export const languageImpl = () => {
  const l = faker.location.language();
  return { name: l.name, alpha2: l.alpha2, alpha3: l.alpha3 };
};
