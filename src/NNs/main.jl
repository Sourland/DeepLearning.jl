include("dense_layer.jl")
include("metrics.jl")
include("train.jl")
include("utility_functions.jl")

using MLDatasets:MNIST
using MLBase
using JuMP
using Ipopt
using Octavian
x_train, y_train = MNIST.traindata();
x_test, y_test = MNIST.testdata();

@.y_train[y_train % 2 != 0] = -1;
@.y_train[y_train % 2 == 0] = 1;

m, n = size(x_test[:,:,1])

x_train = reshape(x_train, (m*n,size(x_train)[3]))
x_test = reshape(x_test, (m*n,size(x_test)[3]))

# net_layers = [
#             Dense("hidden_layer_1", m*n, 256, ReLU!) 
#             Dense("hidden_layer_2",256, 128, ReLU!) 
#             Dense("output_layer",128, 10, softmax!)
#             ];



# X = float.(x_train)
# y = y_train 
# n_features, n_samples = size(X)
# portfolio = Model(Ipopt.Optimizer)
# @variable(portfolio, alpha[1:n_samples])
# @variable(portfolio, b)
# for i = 1:n_samples
#     @constraint(portfolio, y[i]* alpha'X' * X[:,i] >= 1)
# end
# @constraint(portfolio, sum(alpha) == 0)
# @objective(portfolio, Min, alpha'*alpha)

# optimize!(portfolio)
# net_layers, metrics = train(net_layers, x_train, y_train, 100, 256, 0.05);

# layers, outputs, ŷ = forward(net_layers, x_test);
# confusion_matrix = confusmat(10, y_test.+1, predict(ŷ))
# ROC = roc(y_test, predict(ŷ).-1)

# model_recall = recall(ROC);
# model_precision = precision(ROC)
# model_f1_score = f1score(ROC)
# model_accuracy = get_accuracy(net_layers, x_test, y_test)
# print("ACCURACY "* string(model_accuracy) * " | RECALL: " * string(model_recall) * " | PRECISION: " * string(model_recall) * " | F1: " * string(model_f1_score))