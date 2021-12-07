function vary_Error_Tolerances_To_Compare()
    %create vector of different error tolerances
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
    %iterate through the errTolVec and test each tolerance for both Golden
    %Search and Successive Parabolic Interpolation codes. Save the number
    %of iterations for each in a vector
    for i = 1:length(errTolVec)
        goldenNVec(i) = golden_Search(errTolVec(i));
        spiNVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
        newtNVec(i) = Newtons_1D_Opt(errTolVec(i));
    end
    
    %plot both number of iteration vectors vs the error tolerances on a
    %semi log graph
    figure(1)
    semilogx(errTolVec,goldenNVec,'b','LineWidth',5)
    hold on
    semilogx(errTolVec,spiNVec,'r','LineWidth',5)
    hold on
    semilogx(errTolVec,newtNVec,'k','LineWidth',5)
    legend('Golden Search','Succ. Para. Interp.','Netwton Method')
    xlabel('error tolerance')
    ylabel('# of Iterations')
    title('N vs. tol')
    
    %plot both number of iteration vectors vs the error tolerances on a
    %log graph
    figure(2)
    loglog(errTolVec,goldenNVec,'b','LineWidth',5)
    hold on
    loglog(errTolVec,spiNVec,'r','LineWidth',5)
    hold on
    loglog(errTolVec,newtNVec,'k','LineWidth',5)
    legend('Golden Search','Succ. Para. Interp.','Netwton Method')
    xlabel('error tolerance')
    ylabel('# of Iterations')
    title('N vs. tol')
end