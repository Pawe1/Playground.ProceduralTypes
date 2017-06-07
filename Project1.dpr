program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TSomeClass = class
    function Method(x: Integer): string;
  end;

  TProceduralType = function(x: Integer): string;
  TMethodReference = function(x: Integer): string of object;
  TAnonymous = reference to function(x: Integer): string;   // equivalent of TFunc<string, Integer>

function IndependentStaticFunction(x: Integer): string;
begin
  Result := 'IndependentStaticFunction';
end;

function TSomeClass.Method(x: Integer): string;
begin
  Result := 'TSomeClass.Method';
end;

var
  SomeInstance: TSomeClass;
  ExampleProcedure: TProceduralType;
  ExampleMethod: TMethodReference;
  ExampleAnonymous: TAnonymous;

begin
  SomeInstance := TSomeClass.Create;

  ExampleProcedure := IndependentStaticFunction;
//  ExampleProcedure := SomeInstance.Method;   IMPOSSIBLE
//  ExampleProcedure := function(x: Integer): string   IMPOSSIBLE
//                      begin
//                        Result := 'Anonymous';
//                      end;

//  ExampleMethod := IndependentStaticFunction;   IMPOSSIBLE
  ExampleMethod := SomeInstance.Method;
//  ExampleMethod := function(x: Integer): string;   IMPOSSIBLE
//                   begin
//                     Result := 'Anonymous';
//                   end;

  ExampleAnonymous := IndependentStaticFunction;
  ExampleAnonymous := SomeInstance.Method;
  ExampleAnonymous := function(x: Integer): string
                      begin
                        Result := 'Anonymous';
                      end;

  Readln;
  SomeInstance.Free;
end.
