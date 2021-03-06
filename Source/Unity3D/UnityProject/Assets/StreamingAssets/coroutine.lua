--
-- Created by IntelliJ IDEA.
-- User: vimfung
-- Date: 2017/7/5
-- Time: 下午4:38
-- To change this template use File | Settings | File Templates.
--


function Resume(func)
    coroutine.resume(func)
end

function Test()

    logic = coroutine.create(function()
        while true do
            local value = GetValue() --返回function?
            print ("------ value = ", value);
            local r, g, b = GetPixel(1000, 1200) --返回1000, 1200
            print ("------ r, g, b = ", r, g, b);
            coroutine.yield()
        end
    end)

    Resume(logic);

end

function TestModuleFunc()

    local tfunc = coroutine.create(function()

        print (LogModule.test({111, 2222}));

        coroutine.yield()

    end)

    coroutine.resume(tfunc);

end

function TestClassFunc()

    local tfunc = coroutine.create(function()

        print ("+++++++++++++");

        local p = Person.create();
        print (p);

        p:speak();

        p = Person.createPerson();
        print (p);

        p:setName("vim");
        print (p:name());

        Person.printPersonName(p);

        coroutine.yield()

    end)

    coroutine.resume(tfunc);

end

function TestClassImportFunc()

    local tfunc = coroutine.create(function()

        local NativePerson = ClassImport('NativeData');
        local Person = ClassImport('Person');
        print(Person, NativePerson);
        local p = NativePerson.createPerson();
        print(p);
        p:setName('abc');
        p:speak();

        coroutine.yield()

    end)

    coroutine.resume(tfunc);

end

Test();
TestModuleFunc();
TestClassFunc();
TestClassImportFunc();
