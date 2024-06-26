library(phangorn)

# Session -> Set working directory -> To source file location

# We create a tree and csv file
#data(carnivora)
#frm <- ~SuperFamily/Family/Genus/Species
#tr <- as.phylo(frm, data = carnivora, collapse=FALSE)
#plot(tr, "u", show.node.label=TRUE, cex=.5, lab4ut="axial")
#write.tree(tr, "carnivora.nwk")
#write.csv(carnivora, "carnivora.csv", row.names = FALSE, quote=FALSE)
#tr$edge.length <- rep(.1, 194)
#carnivora_fake_dna <- simSeq(tr, 1000)
#write.phyDat(carnivora_fake_dna, "carnivora_fake_dna.fasta", format="fasta")
#summary(carnivora)
#short_names <- abbreviateGenus(carnivora$Species)
#short_names <- gsub(" ", "_", short_names)
#carnivora$ShortSpecies <- short_names
#write.csv(carnivora, "carnivora.csv", row.names = FALSE, quote=FALSE)

tr <- read.tree("carnivora.nwk")
plot(tr, "u", show.node.label=TRUE, cex=.5, lab4ut="axial")

carnivora <- read.csv("carnivora.csv")


head(carnivora)
summary(carnivora)
# replace space with underscore
carnivora$Species <- gsub(" ", "_", carnivora$Species)

# create a named vector with colors and names (SuperFamily or Species later on)
x <- setNames(c("red", "blue"), unique(carnivora$SuperFamily))
col <- x[carnivora$SuperFamily]
names(col) <- carnivora$Species
col[1:10]
plot(tr, "u", show.node.label=TRUE, tip.color = col[tr$tip.label], cex=.5, lab4ut="axial")

x <- setNames(c("red", "blue","yellow","green","pink","darkgreen","lightblue","purple"), unique(carnivora$Family))
col <- x[carnivora$Family]
names(col) <- carnivora$Species
plot(tr, "u", show.node.label=TRUE, tip.color = col[tr$tip.label], cex=.5, lab4ut="axial")


## Shorten / replace species names
dna <- read.phyDat("carnivora_fake_dna.fasta", format="fasta", type="DNA")
names(dna)
x <- setNames(unique(carnivora$ShortSpecies), carnivora$Species)
names(dna) <- x[names(dna)]
write.phyDat(dna, "carnivora_short_names.fasta", format="fasta")




