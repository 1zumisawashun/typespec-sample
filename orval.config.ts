import { defineConfig } from "orval";

const outputConfig = {
  mode: "tags-split",
  fileExtension: ".generated.ts",
  client: "fetch",
  baseUrl: "http://localhost:3000",
  mock: true,
  biome: true,
  prettier: true,
} as const;

export default defineConfig({
  petstore: {
    output: {
      ...outputConfig,
      target: "src/features/petstore/endpoints",
      schemas: "src/features/petstore/models",
      override: {
        mutator: {
          path: "./src/functions/custom-fetch.ts",
          name: "customFetch",
        },
      },
    },
    input: {
      target: "./dist/schema/openapi.Petstore.yaml",
    },
  },
  servicePlanCsv: {
    output: {
      ...outputConfig,
      target: "src/features/service-plan-csv/endpoints",
      schemas: "src/features/service-plan-csv/models",
      override: {
        mutator: {
          path: "./src/functions/custom-fetch.ts",
          name: "customFetch",
        },
      },
    },
    input: {
      target: "./dist/schema/openapi.ServicePlanCsv.yaml",
    },
  },
});
