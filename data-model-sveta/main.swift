//
//  main.swift
//  SwiftBitVector
//
//  Created by John Huelsenbeck on 7/9/19.
//  Copyright © 2019 John Huelsenbeck. All rights reserved.
//
import Foundation

var myb = Bitvector()
myb += false
myb[0] = true
print(myb)

var dna = try TaxonDataDNA(taxonName: "Taxon A", nucleotideString: "aacg TTCca-")
print(dna)

var rna = try TaxonDataRNA(taxonName: "Taxon 1", nucleotideString: "aacg UUCca")
print(rna)

var aa = try TaxonDataProtein(taxonName: "Taxon I", aminoAcidString: "GALMFWKQESPVICYHRNDT?-")
print(aa)

try dna += "TTTTT"

let encoder = JSONEncoder()
let jsonData = try encoder.encode(dna)
let string = String(data: jsonData, encoding: .utf8)!
print(string)
let decoder = JSONDecoder()
let sameDna = try decoder.decode(TaxonDataDNA.self, from: jsonData)
print(dna)
print(sameDna)


var td1 = try TaxonDataDNA(taxonName: "Taxon 1", nucleotideString: "AAAAAAAAAA")
var td2 = try TaxonDataDNA(taxonName: "Taxon 2", nucleotideString: "CCCCCCCCCC")
var td3 = try TaxonDataDNA(taxonName: "Taxon 3", nucleotideString: "GGGGGGGGGG")
var td4 = try TaxonDataDNA(taxonName: "Taxon 4", nucleotideString: "TTTTTTTTTT")
var m = DataMatrix(name: "Test data matrix")
try m.addTaxonData(taxonData: td1.copy() as! TaxonDataDNA)
try m.addTaxonData(taxonData: td2.copy() as! TaxonDataDNA)
try m.addTaxonData(taxonData: td3.copy() as! TaxonDataDNA)
try m.addTaxonData(taxonData: td4.copy() as! TaxonDataDNA)


try td4 += "ACGT"
m[0,0] = "M"

m.deleteCharacter(characterIdx: 2)
m.deleteTaxon(taxonIdx: 1)
print(m)

print(m[1,1])


let mData = try encoder.encode(m)
let sameM = try decoder.decode(DataMatrix.self, from: mData)
sameM[1,1] = "Y"
print(m)
print(sameM)


var stData1 = try TaxonDataStandard(taxonName: "Taxon I",   charcterDataString: "010101010?", possibleStates: "01", missingCharacter: "?")
var stData2 = try TaxonDataStandard(taxonName: "Taxon II",  charcterDataString: "010101010?", possibleStates: "01", missingCharacter: "?")
var stData3 = try TaxonDataStandard(taxonName: "Taxon III", charcterDataString: "010101010?", possibleStates: "01", missingCharacter: "?")
var stData4 = try TaxonDataStandard(taxonName: "Taxon IV",  charcterDataString: "010101010?", possibleStates: "01", missingCharacter: "?")
var m2 = DataMatrix(name: "Test standard data matrix")
try m2.addTaxonData(taxonData: stData1.copy() as! TaxonDataStandard)
try m2.addTaxonData(taxonData: stData2.copy() as! TaxonDataStandard)
try m2.addTaxonData(taxonData: stData3.copy() as! TaxonDataStandard)
try m2.addTaxonData(taxonData: stData4.copy() as! TaxonDataStandard)

print(m2)


//try m.writeNexusFile(pathName: "/Users/svetakrasikova/Desktop", fileName: "file1.nex")
//try m2.writeNexusFile(pathName: "/Users/svetakrasikova/Desktop", fileName: "file2.nex")


var a = try TaxonDataDNA(taxonName: "Taxon 1", nucleotideString: "AAAAAAAAAA")
var b = try TaxonDataDNA(taxonName: "Taxon 1", nucleotideString: "CCCCCCCCCC")
var c = try a + b

print(a)
print(b)
print(c!)
