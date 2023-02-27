# Random Number Generating Algorithms (May 2021)

This project formed part of my Theoretical Statistics course. Random number generating algorithms are procedures that can be used to create independent, random observations from a specified statistical distribution. This is usually done with the help of computer software packages. Most modern software packages are pre-equipped to produce random samples from a host of statistical distributions. Nevertheless, it is still useful to understand how these software packages produce random samples from these distributions. Almost all software packages are capable of uniformly generating random real numbers within a fixed interval - a Uniform distribution. This is usually done within the interval 0 and 1. Random number generating algorithms take advantage of this basic capability to produce random observations from a host of statistical distributions, given that the form of the desired distribution’s probability density function (pdf) - or a related probability density function - is known. It should be noted that these random observations are actually pseudo random, rather than truly random.

This report investigates 3 common random number generating algorithms. The Inverse Transform Method, the Box Muller Method, as well as the Acceptance Rejection Method. The Inverse Transform Method (ITM) utilises the inverse Cumulative Distribution Function (CDF) of a distribution to generate random observations from the desired distribution. The Box Muller Method (BMM) is an algorithm specifically designed to generate random observations from the Normal distribution. While a detailed treatment of the mathematical derivation of this method is beyond the scope of this introductory report, a brief overview of some of the key concepts in the derivation are provided. Lastly, the Acceptance Rejection Method (ARM) is an algorithm that samples from a target distribution by comparing the pdf of the target distribution to the pdf of an alternative distribution that is easy to sample from.
