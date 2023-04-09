# faulty_honey_encryption
This reppository is intended to indicate a possible vulnerability in honey encryption methodology

The honey encryption methodology is implemented in "encrypt.py", which is taken from repository: https://github.com/torjusbr/bip39-honey-encryption.

The honey encryption adds the zone of focus after decryption as well, where wrong keys can generate plausable plaintext.

The bash file is used to generate a small dataset, to perform a statistical or unsupervised learning analaysis. The dataset created by bash file is basically the correct key and random keys, with corresponding plaintexts.
This dataset can be identified with txt files "plaintexter_*.txt".

In current scenario, the correct plaintext is sequence of words "arm, armed, army". We can think each individual word as chunk of plaintext.

# Approach
In my statisitcal analysis, my basic hypothesis is that real world plaintexts are contextual, i.e. one part of the text can be somewhat related to the other part.

In this course, one could consider employing NLP approaches to determine similarity in some suitable notion.

For example, in the Glove Embedding view of the gathered dataset (which can adversary may find as well), projected onto 3D plane by PCA, looks like this:

![image](https://user-images.githubusercontent.com/47445756/230747195-07da6cbc-aa0b-49da-99b5-bc512f14f48e.png)


One could employ an unsupervised clustering algorithm like Spectral Clustering to chunks to determine possible clusters as plaintext islands. Lets call these islands P. Here is a comparison:

![image](https://user-images.githubusercontent.com/47445756/230747356-466bfaf5-fc46-4410-8eef-442f8ee13a7d.png)


Next, we excercise the main hypothesis to filter the possible plaintexts as the real texts, and thus bypassing the strength of honey encryption, by thresholding those chunks that are close less than a threshold.
In this consideration, I employ DBSAN to perform density based clustering, to identify another set of islands. Lets call these islands P'. As shown in following figure, where three such islands have been identified. The plane shown is equidistant from the centroid of these clusters.
![image](https://user-images.githubusercontent.com/47445756/230747656-aa02993a-87cf-4ec7-9574-f59987d43e80.png)

Having identified P and P', the correct plaintext is x in P that has maximum chunks in P', which in our case is the original plaintext "arm, armed, army". Henceforth, this is the proof of context of honey encryption being blind to NLP.








#References
Juels, Ari, and Thomas Ristenpart. "Honey encryption: Security beyond the brute-force bound." Advances in Cryptology–EUROCRYPT 2014: 33rd Annual International Conference on the Theory and Applications of Cryptographic Techniques, Copenhagen, Denmark, May 11-15, 2014. Proceedings 33. Springer Berlin Heidelberg, 2014.
