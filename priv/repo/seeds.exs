# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FormulaOneDataManager.Repo.insert!(%FormulaOneDataManager.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

IO.puts("starting seeding the database")

alias FormulaOneDataManager.Drivers.Driver
alias FormulaOneDataManager.Repo
now = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

drivers = [
  %{
    name: "Max Verstappen",
    country: "Netherlands",
    date_of_birth: ~D[1997-09-30],
    poles: 27,
    race_wins: 43,
    fastest_laps: 26,
    inserted_at: now,
    updated_at: now,
    number: 1
  },
  %{
    name: "Sergio Perez",
    country: "Mexico",
    date_of_birth: ~D[1990-01-26],
    poles: 3,
    race_wins: 6,
    fastest_laps: 11,
    inserted_at: now,
    updated_at: now,
    number: 11
  },
  %{
    name: "Lewis Hamilton",
    country: "Great Britain",
    date_of_birth: ~D[1985-01-07],
    poles: 103,
    race_wins: 103,
    fastest_laps: 63,
    inserted_at: now,
    updated_at: now,
    number: 44
  },
  %{
    name: "George Russel",
    country: "Great Britain",
    date_of_birth: ~D[1998-02-15],
    poles: 1,
    race_wins: 1,
    fastest_laps: 6,
    inserted_at: now,
    updated_at: now,
    number: 63
  },
  %{
    name: "Fernando Alonso",
    country: "Spain",
    date_of_birth: ~D[1981-07-29],
    poles: 22,
    race_wins: 32,
    fastest_laps: 23,
    inserted_at: now,
    updated_at: now,
    number: 14
  },
  %{
    name: "Lance Stroll",
    country: "Canada",
    date_of_birth: ~D[1998-10-29],
    poles: 1,
    race_wins: 0,
    fastest_laps: 0,
    inserted_at: now,
    updated_at: now,
    number: 18
  },
  %{
    name: "Charles Leclec",
    country: "Monaco",
    date_of_birth: ~D[1997-10-16],
    poles: 19,
    race_wins: 5,
    fastest_laps: 7,
    inserted_at: now,
    updated_at: now,
    number: 16
  },
  %{
    name: "Carlos Sainz",
    country: "Spain",
    date_of_birth: ~D[1994-09-01],
    poles: 3,
    race_wins: 1,
    fastest_laps: 3,
    inserted_at: now,
    updated_at: now,
    number: 55
  },
  %{
    name: "Lando Norris",
    country: "Great Britain",
    date_of_birth: ~D[1999-11-13],
    poles: 1,
    race_wins: 0,
    fastest_laps: 5,
    inserted_at: now,
    updated_at: now,
    number: 4
  },
  %{
    name: "Oscar Piastri",
    country: "Australia",
    date_of_birth: ~D[2001-04-06],
    poles: 0,
    race_wins: 0,
    fastest_laps: 0,
    inserted_at: now,
    updated_at: now,
    number: 81
  },
  %{
    name: "Esteban Ocon",
    country: "France",
    date_of_birth: ~D[1996-09-17],
    poles: 0,
    race_wins: 1,
    fastest_laps: 0,
    inserted_at: now,
    updated_at: now,
    number: 31
  },
  %{
    name: "Pierre Gasly",
    country: "Australia",
    date_of_birth: ~D[1996-02-07],
    poles: 0,
    race_wins: 1,
    fastest_laps: 3,
    inserted_at: now,
    updated_at: now,
    number: 10
  },
  %{
    name: "Alexander Albon",
    country: "Malasia",
    date_of_birth: ~D[1996-03-23],
    poles: 0,
    race_wins: 0,
    fastest_laps: 0,
    inserted_at: now,
    updated_at: now,
    number: 23
  },
  %{
    name: "Logan Sargeant",
    country: "USA",
    date_of_birth: ~D[2000-12-31],
    poles: 0,
    race_wins: 0,
    fastest_laps: 0,
    inserted_at: now,
    updated_at: now,
    number: 2
  },
  %{
    name: "Nico Hulkenberg",
    country: "Germany",
    date_of_birth: ~D[1987-08-19],
    poles: 1,
    race_wins: 0,
    fastest_laps: 2,
    inserted_at: now,
    updated_at: now,
    number: 27
  },
  %{
    name: "Kevin Magnussen",
    country: "Denmark",
    date_of_birth: ~D[1992-10-05],
    poles: 1,
    race_wins: 0,
    fastest_laps: 2,
    inserted_at: now,
    updated_at: now,
    number: 20
  },
  %{
    name: "Valtteri Bottas",
    country: "Finland",
    date_of_birth: ~D[1989-08-28],
    poles: 20,
    race_wins: 10,
    fastest_laps: 19,
    inserted_at: now,
    updated_at: now,
    number: 77
  },
  %{
    name: "Zhou Guanyu",
    country: "China",
    date_of_birth: ~D[1999-05-30],
    poles: 0,
    race_wins: 0,
    fastest_laps: 2,
    inserted_at: now,
    updated_at: now,
    number: 24
  },
  %{
    name: "Yuki Tsunoda",
    country: "Japan",
    date_of_birth: ~D[2000-05-11],
    poles: 0,
    race_wins: 0,
    fastest_laps: 0,
    inserted_at: now,
    updated_at: now,
    number: 22
  },
  %{
    name: "Nyck De Vries",
    country: "Netherlands",
    date_of_birth: ~D[1995-02-06],
    poles: 0,
    race_wins: 0,
    fastest_laps: 0,
    inserted_at: now,
    updated_at: now,
    number: 21
  },
  %{
    name: "Daniel Ricciardo",
    country: "Australia",
    date_of_birth: ~D[1989-07-01],
    poles: 3,
    race_wins: 8,
    fastest_laps: 16,
    inserted_at: now,
    updated_at: now,
    number: 3
  }
]

IO.puts("- inserting drivers from Season 2023")

Repo.insert_all(Driver, drivers)

IO.puts("seeding is completed.")
