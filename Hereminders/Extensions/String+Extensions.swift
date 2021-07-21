extension String {

    func removingSpaces() -> String {

        return self.replacingOccurrences(of: " ", with: "")
    }
}
