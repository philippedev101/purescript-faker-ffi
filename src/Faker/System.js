import { faker } from "@faker-js/faker";

export const fileNameImpl = () => faker.system.fileName();

export const commonFileNameImpl = () => faker.system.commonFileName();

export const commonFileNameExtImpl = (ext) => () =>
  faker.system.commonFileName(ext);

export const mimeTypeImpl = () => faker.system.mimeType();

export const commonFileTypeImpl = () => faker.system.commonFileType();

export const commonFileExtImpl = () => faker.system.commonFileExt();

export const fileTypeImpl = () => faker.system.fileType();

export const fileExtImpl = () => faker.system.fileExt();

export const fileExtMimeImpl = (mimeType) => () =>
  faker.system.fileExt(mimeType);

export const directoryPathImpl = () => faker.system.directoryPath();

export const filePathImpl = () => faker.system.filePath();

export const semverImpl = () => faker.system.semver();

export const networkInterfaceImpl = () => faker.system.networkInterface();

export const networkInterfaceOptsImpl = (opts) => () =>
  faker.system.networkInterface(opts);

export const cronImpl = () => faker.system.cron();

export const cronOptsImpl = (opts) => () => faker.system.cron(opts);
