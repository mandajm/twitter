
requierd '../lib/say_hello'

describ "the say_hello method" do

        it "envoyer mon premier bot" do
            expect(say_hello("hello")).to eq("hello")
        end

end