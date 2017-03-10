export const fetchAllPokemon = () => (
  $.ajax({
    url: 'api/pokemon',
    method: 'GET'
  })
);

export const fetchOnePokemon = (id) => (
  $.ajax({
    url: `api/pokemon/${id}`,
    method: 'GET'
  })
);

export const createPokemon = (poke) => (
  $.ajax({
    url: `api/pokemon`,
    method: 'POST',
    data: poke
  })
);
