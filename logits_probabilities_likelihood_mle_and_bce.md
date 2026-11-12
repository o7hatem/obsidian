---
tags:
  - ai
  - mle
---

# What are logits and probabilities?

Logits are the raw output from the last linear layer of the model. It isn't bounded, therefore it can be any value from $-\infty$ to $\infty$. 

Probabilities are what you get when you use a bounded function with logits. For example, When passing logits to a sigmoid function. We get the probability of the input belonging to the positive class.
$$ P(y=1)= σ(z)= \frac{1} {1+e^{−z}} $$
Unlike probabilities, logits don't sum up to 1 or any other constant. 

# What is the difference between probability and likelihood?

Probabilities and Likelihood ask different questions.

**Probability** asks: Given a probability model or hypothesis, how likely is the observed outcome.
**Likelihood** asks: Given an observed outcome, how plausible are different models or hypotheses.

Mathematically, they are very similar. What's different is which is considered fixed and which varies.

In probability, the parameters are fixed, data vary.
$$ P(data \ | \ \theta)$$
In likelihood, the data is fixed, the parameters vary.
$$ L(\theta \ | \ data) $$

> [!NOTE] Model, Parameters, and Data
> 
> When we mention a model, we don't refer to a machine learning model. In fact, we refer to a probability distribution. 
> 
> The parameters ($\theta$) are the variables that defines this probabilistic distribution. 
> 
> For example, Normal distribution or Gaussian distribution is a type of continuous probability distribution for a real-valued random variable. The parameters of a normal distribution are the mean ($\mu$) and standard deviation ($\sigma$).
> 
> On the other hand, data is the observed outcome of an experiment.
> 


## Example with numbers.

Suppose you flipped a coin 10 times and observed: 7 heads, 3 tails

Now let's calculate the probability and likelihood.

#### **Probability: Fix the coin, vary the data**

Assuming the coin is fair, then the probability of getting a head ($p$) is 0.5

Since we are talking about coin flips, this will be a binomial distribution.
$$P(data \ | \ \theta) = P(getting \ 7 \ heads \ | \ p =0.5) = \binom{10}{7} (0.5)^7 (0.5)^3 = 0.117$$

> [!Note] Why did we use the binomial distribution?
> The binomial distribution models the number of successes in a fixed number of independent experiments, each with two possible outcomes (success or failure) and a constant probability of success. 
> 
> It is commonly denoted as $B(n, p)$, where $n$ is the number of trials and $p$ is the probability of success on each trial

#### **Likelihood: Fix the data, vary the coin**

Now imagine the data (7 heads, 3 tails) are fixed. Let's compare several possible values of p.

The likelihood is

$$L(p)\propto p^7(1−p)^3$$

Ignoring the common constant $\binom{10}{7}$, we get:

| $p$ | likelihood of $p^7 (1-p)^3$ |
| :-: | :-------------------------: |
| 0.3 |           0.00041           |
| 0.5 |           0.00098           |
| 0.7 |           0.00222           |
| 0.9 |           0.00048           |
$p=0.7$ gives the **largest likelihood**.

Therefore, it makes sense to say that likelihood is finding the parameters ($\theta$) that maximizes the probability of the observed data.

# Likelihood Function

Likelihood is the joint probability of all observed values.
$$
L(\theta) = P(x_1, x_2, ..., x_n \ | \ \theta) = P(x_1 \ | \ \theta)P(x_2 \ | \ \theta)...P(x_n \ | \ \theta) = \prod_{i=1}^{n} P(x_i \ | \ \theta)
$$

> [!Question]- What does it mean for random variables to be conditionally independent?
> You'll find the answer in this [DataCamp article on MLE](https://www.datacamp.com/tutorial/maximum-likelihood-estimation-mle). In step 2 (Writing the likelihood function)


# Maximum Likelihood Function

Now, we have figured out the likelihood function. We can treat $L(\theta)$ as a function of $\theta$ and try to find the maximum value by finding the first derivate and equate it to zero.

## A quick trick

A simple modification we can make for the likelihood function is using the natural logarithm to make the calculations much simpler.

Why natural logarithm? Natural logarithm is an increasing function. Meaning the $\theta$ that maximizes the likelihood function $ln \ L(\theta)$  is also the value of $\theta$ which maximizes the likelihood function $L(\theta)$.

With that we get log-likelihood.

 Benefits of the log function:
 1. It turns the product in the likelihood function into summation
	 $$
	 L(\theta) = \sum_{i=1}^{n} P(x_i \ | \ \theta)
	 $$
2. As we mentioned before, The log function is monotonic, so maximizing the log-likelihood gives the same θ as maximizing the likelihood.
## Who said anything about maximizing?

Well, Let's leave all this statistics behind and remember what are we trying to accomplish in the first place. We started wanting to find the parameters that <u>minimizes</u> the loss function. 

Well, it turns output its as simple as putting a negative sign in front of the equation. This turn the curve on its head. 

---
# What is next?
*  BCE is the negative log-likelihood of Bernoulli distriubution

\[Answer in a different note\] Why does BCE work better as a loss function than MSE when used with a sigmoid activation function? 

---
# References

1. [1.2 Maximum Likelihood Estimation | STAT 415](https://online.stat.psu.edu/stat415/lesson/1/1.2). Great explanation. I hate how simple and easy to understand the authors make it seem.
2. [Introduction to Maximum Likelihood Estimation (MLE) | DataCamp](https://www.datacamp.com/tutorial/maximum-likelihood-estimation-mle). Be careful, because the definition they mentioned for likelihood is actually wrong. They confused the definition for likelihood with the definition for probability. How ironic.
3. [Cross-Entropy Loss | TensorTonic](https://www.tensortonic.com/ml-math/information-theory/cross-entropy). It's a good source, but it's terribly structured. So take what you want and leave the rest.



