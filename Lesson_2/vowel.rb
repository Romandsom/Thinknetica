vowel = ['A', 'E', 'I', 'O', 'U', 'Y']
alfabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
'U', 'V', 'W', 'X', 'Y', 'Z']
x = 0
index = []
hash_result = {}
while x < vowel.count
  vowelcount = alfabet.index (vowel[x])
  index.push(vowelcount)
  hash_result[index[x]] = vowel[x]
  x = x + 1
end
print hash_result
