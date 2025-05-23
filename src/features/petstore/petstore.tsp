import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

using Http;
using OpenAPI;

@service(#{ title: "Swagger Petstore" })
@info(#{ version: "1.0.0", license: #{ name: "MIT" } })
namespace Petstore;

@oneOf
union Pet {
  Dog,
  Cat,
}

// @discriminated(#{ envelope: "none", discriminatorPropertyName: "breed" })
@oneOf
union Dog {
  Labradoodle,
  Dachshund,
}

model Labradoodle {
  cuteness: integer;
}

model Dachshund {
  length: integer;
}

model Cat {
  petsRequested?: integer;
  type: "cat";
}

model Pets is Pet[];

model Error {
  code: int32;
  message: string;
}

@tag("petstore")
@route("/pets")
@get
@summary("List all pets")
op listPets(
  /**
   * How many items to return at one time (max 100)
   */
  @query(#{ explode: true }) limit?: string,
): Pets;

@tag("petstore")
@route("/pets")
@post
@summary("Create a pet")
op createPets(
  @body body: {
    name: string;
    tag: string;
  }[],
): Pet | GeneratedHelpers.DefaultResponse<
  Description = "unexpected error",
  Body = Error
>;

@tag("petstore")
@route("/pets")
@put
@summary("Update a pet")
op updatePets(@body body: Pet): Pet | GeneratedHelpers.DefaultResponse<
  Description = "unexpected error",
  Body = Error
>;

@tag("petstore")
@route("/pets/{petId}")
@get
@summary("Info for a specific pet")
op showPetById(
  /**
   * The id of the pet to retrieve
   */
  @path petId: string,

  /**
   * The id of the pet to retrieve
   */
  @path testId: string,
): Pet | GeneratedHelpers.DefaultResponse<
  Description = "unexpected error",
  Body = Error
>;

namespace GeneratedHelpers {
  @doc(Description)
  @error
  model DefaultResponse<
    Description extends valueof string = "",
    Body = void,
    Headers extends {} = {}
  > {
    @body body: Body;
    ...Headers;
  }
}
