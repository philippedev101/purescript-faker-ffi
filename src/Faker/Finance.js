import { faker } from "@faker-js/faker";

export const accountNumberImpl = () => faker.finance.accountNumber();

export const accountNumberOptsImpl = (opts) => () =>
  faker.finance.accountNumber(opts);

export const accountNameImpl = () => faker.finance.accountName();

export const routingNumberImpl = () => faker.finance.routingNumber();

export const amountImpl = () => faker.finance.amount();

export const amountOptsImpl = (opts) => () => faker.finance.amount(opts);

export const transactionTypeImpl = () => faker.finance.transactionType();

export const currencyImpl = () => {
  const c = faker.finance.currency();
  return { name: c.name, code: c.code, symbol: c.symbol, numericCode: c.numericCode };
};

export const currencyCodeImpl = () => faker.finance.currencyCode();

export const currencyNameImpl = () => faker.finance.currencyName();

export const currencySymbolImpl = () => faker.finance.currencySymbol();

export const bitcoinAddressImpl = () => faker.finance.bitcoinAddress();

export const litecoinAddressImpl = () => faker.finance.litecoinAddress();

export const creditCardNumberImpl = () => faker.finance.creditCardNumber();

export const creditCardNumberOptsImpl = (opts) => () =>
  faker.finance.creditCardNumber(opts);

export const creditCardCVVImpl = () => faker.finance.creditCardCVV();

export const creditCardIssuerImpl = () => faker.finance.creditCardIssuer();

export const pinImpl = () => faker.finance.pin();

export const pinNImpl = (length) => () => faker.finance.pin({ length });

export const ethereumAddressImpl = () => faker.finance.ethereumAddress();

export const ibanImpl = () => faker.finance.iban();

export const ibanOptsImpl = (opts) => () => faker.finance.iban(opts);

export const bicImpl = () => faker.finance.bic();

export const bicOptsImpl = (opts) => () => faker.finance.bic(opts);

export const currencyNumericCodeImpl = () => faker.finance.currencyNumericCode();

export const transactionDescriptionImpl = () =>
  faker.finance.transactionDescription();
