export const fetchBenches = () => (
  $.ajax({
    method: "GET",
    url: "api/benches"
  })
);

export const fetchBench = (bench) => (
  $.ajax({
    method: "GET",
    url: `api/benches/${bench.id}`
  })
);

export const createBench = (bench) => (
  $.ajax({
    method: "POST",
    url: 'api/benches',
    bench
  })
);
