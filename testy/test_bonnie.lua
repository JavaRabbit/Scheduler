package.path = package.path..";../?.lua"

local Kernel = require("schedlua.kernel")()


local function numbers(ending)
	local foo = 0;
	local function baz()
		foo = foo + 1
		if foo > ending then
			return nil;
		end
		return foo;
	end

	return baz;
end
	
local function task1()
	print("first task, first line")
	yield();
	print("first task, second line")
end

local function counter(name, nCount)
	for num in numbers(nCount) do
		print(name, num);
		yield();
	end
	halt();
end

local function main()
	local t0 = spawn(counter, "counting1", 5)
end

run(main)

print("All tasks in main are done")
