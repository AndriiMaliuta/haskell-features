fib :: Int -> Int

fib n =
  if n < 2 then
    n
  else
    fib (n - 1) + fib (n - 2)

main = putStrLn $ show $ fib 30