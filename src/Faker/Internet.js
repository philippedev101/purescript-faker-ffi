import { faker } from "@faker-js/faker";

export const emailImpl = () => faker.internet.email();

export const emailOptsImpl = (opts) => () => faker.internet.email(opts);

export const exampleEmailImpl = () => faker.internet.exampleEmail();

export const exampleEmailOptsImpl = (opts) => () => faker.internet.exampleEmail(opts);

export const usernameImpl = () => faker.internet.username();

export const usernameOptsImpl = (opts) => () => faker.internet.username(opts);

export const displayNameImpl = () => faker.internet.displayName();

export const displayNameOptsImpl = (opts) => () => faker.internet.displayName(opts);

export const protocolImpl = () => faker.internet.protocol();

export const httpMethodImpl = () => faker.internet.httpMethod();

export const httpStatusCodeImpl = () => faker.internet.httpStatusCode();

export const urlImpl = () => faker.internet.url();

export const urlOptsImpl = (opts) => () => faker.internet.url(opts);

export const domainNameImpl = () => faker.internet.domainName();

export const domainSuffixImpl = () => faker.internet.domainSuffix();

export const domainWordImpl = () => faker.internet.domainWord();

export const ipImpl = () => faker.internet.ip();

export const ipv4Impl = () => faker.internet.ipv4();

export const ipv4OptsImpl = (opts) => () => faker.internet.ipv4(opts);

export const ipv6Impl = () => faker.internet.ipv6();

export const portImpl = () => faker.internet.port();

export const userAgentImpl = () => faker.internet.userAgent();

export const macImpl = () => faker.internet.mac();

export const macWithSeparatorImpl = (separator) => () => faker.internet.mac({ separator });

export const passwordImpl = () => faker.internet.password();

export const passwordOptsImpl = (opts) => () => faker.internet.password(opts);

export const emojiImpl = () => faker.internet.emoji();

export const jwtImpl = () => faker.internet.jwt();

export const jwtAlgorithmImpl = () => faker.internet.jwtAlgorithm();
