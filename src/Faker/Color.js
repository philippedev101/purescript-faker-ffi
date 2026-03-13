import { faker } from "@faker-js/faker";

export const humanImpl = () => faker.color.human();

export const spaceImpl = () => faker.color.space();

export const rgbImpl = () => faker.color.rgb();

export const rgbCssImpl = () => faker.color.rgb({ format: "css" });

export const cmykImpl = () => faker.color.cmyk({ format: "css" });

export const hslImpl = () => faker.color.hsl({ format: "css" });

export const hwbImpl = () => faker.color.hwb({ format: "css" });

export const labImpl = () => faker.color.lab({ format: "css" });

export const lchImpl = () => faker.color.lch({ format: "css" });

export const cssSupportedFunctionImpl = () => faker.color.cssSupportedFunction();

export const cssSupportedSpaceImpl = () => faker.color.cssSupportedSpace();

export const colorByCSSColorSpaceImpl = () => faker.color.colorByCSSColorSpace();

export const colorByCSSColorSpaceOptsImpl = (opts) => () =>
  faker.color.colorByCSSColorSpace(opts);
