# media.ex

defmodule Subject do
  @moduledoc """
  Defines the structure for a school subject and its result.
  """
  defstruct [:name, :result]
end

defmodule Student do
  @moduledoc """
  Defines the structure for a student, containing their name and a list of Subject results.
  """
  defstruct [:name, :results]
end

defmodule Calculator do
  def start do
    joao = %Student{
      name: "João Joaquim",
      results: build_subjects([5.2, 3.9, 2.7, 9.8])
    }

    maria = %Student{
      name: "Maria da Silva",
      results: build_subjects([8.4, 7.5, 9.4, 2.8])
    }

    pedro = %Student{
      name: "Pedro Pedrada",
      results: build_subjects([1.3, 8.5, 8.9, 7.6])
    }

    kaua = %Student{
      name: "Kauã Camboinhas",
      results: build_subjects([5.4, 4.9, 2.2, 3.8])
    }

    calculated_results = calculate([joao, maria, pedro, kaua])
    best = best_result(calculated_results)

    # Use IO.inspect to print the results to the console
    IO.puts("--- All Student Averages ---")
    IO.inspect(calculated_results, label: "Results")
    IO.puts("\n--- Best Performing Student(s) ---")
    IO.inspect(best, label: "Best")

    {calculated_results, best}
  end

  defp calculate(students) do
    Enum.map(students, fn student ->
      # Split the full name into first and last names
      [first_name | last_name_parts] = String.split(student.name, " ")

      %{
        first_name: first_name,
        last_name: Enum.join(last_name_parts, " "),
        average: average(student)
      }
    end)
  end

  defp average(student) do
    # student.results is a list of %Subject{} structs
    grades = Enum.map(student.results, &(&1.result))
    total_grades = Enum.count(grades)
    sum_of_grades = Enum.sum(grades)

    # Avoid division by zero if there are no grades
    if total_grades > 0 do
      Float.round(sum_of_grades / total_grades, 2)
    else
      0.0
    end
  end

  defp best_result(students) do
    # Find the highest average score
    best_avg = students |> Enum.map(&(&1.average)) |> Enum.max()

    # Filter for all students who have that score
    Enum.filter(students, &(&1.average == best_avg))
  end

  defp build_subjects(results) do
    # Note the typo "História " was fixed
    subjects = ["Matemática", "Português", "Geografia", "História"]

    # Use Enum.zip to correctly pair subjects with results
    Enum.zip(subjects, results)
    |> Enum.map(fn {subject_name, subject_result} ->
      %Subject{name: subject_name, result: subject_result}
    end)
  end
end

# To run the code, call the start function
Calculator.start()