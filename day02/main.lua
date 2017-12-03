local function extract_diff(line)
  local lower, larger = nil, nil
  for num in line:gmatch("%d+") do
    num = tonumber(num)

    if lower == nil or lower > num then
      lower = num
    end
    if larger == nil or larger < num then
      larger = num
    end
  end
  return larger - lower
end

local function main()
  local total = 0
  for line in io.lines("puzzle.txt") do
    total = total + extract_diff(line)
  end
  return total
end

assert(extract_diff("5 1 9 5") == 8)
assert(extract_diff("7 5 3") == 4)
assert(extract_diff("2 4 6 8") == 6)
print(main())
