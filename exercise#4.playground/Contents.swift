// Дан массив, элементы которого это картеж с типами данных Int и String. Необходимо:
// - Возвести Int в квадрат
// - Отфильтровать только четные элементы
// - Упорядочить строки по алфовитному возрастанию, можно обозначить буквы на любом языке.


let collection: [(Int, String)] = [(1, "Hello"), (3, "Hallo"), (5, "word"), (8, "тест"), (13, "Deusch"), (21, "test"), (34, "слово")]

func process(this collection: [(number: Int, string: String)]) -> [(Int, String)] {
    return collection.map {
        ($0.number * $0.number, $0.string)
    }.filter {
        $0.0.isMultiple(of: 2)
    }.sorted {
        $0.1 < $1.1
    }
}

print("initial collection: \(collection)")
let processed = process(this: collection)
print("processed collection: \(processed)")
