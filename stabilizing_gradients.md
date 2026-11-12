---
tags:
  - ai
  - gradients
---
This topic is probably much bigger than I see. So let's walk through it one step at a time.

# How does normalization stabilizes gradients?

I was writing the code for data setup for the [[Main |Waste Recycling Project]].  During this, there were these lines

```Python
data_transform = transforms.Compose([
	transforms.Resize((128, 128)),
	transforms.ToTensor(),
	transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
])
```

Looks fairly normal. We resize the image so we can handle all the various resolutions of the images. Then, converting them into tensors so we can use them however we want in PyTorch.

The third line was the odd one. It normalizes the images with 3 different means and standard deviations. The 3 pairs are for the 3 color channels. But what are those exact values? And why do we normalize in the first place?

> #To-Be-Written The specific values comes from the means and standard deviation of the ImageNet dataset. The question is why? 

Let's remind ourselves that normalization consists of two steps. 1) Subtracting the mean 2) Dividing by the standard deviation. It turns out each one have a vital impact on stabilizing the gradients.
$$
\hat{x} = \frac{x - \mu}{\sigma}
$$
## Eliminating The Zig-Zag updates

The phenomenon when gradients move like crazy in the loss space, not to converging directly to the minimum, we call this the zig-zag effect. 



## Controlling variance