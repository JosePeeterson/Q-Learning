function visited_states = plott(optim_pol)
% Plot the navigation grid
    figure
    grid on
    axis([0 10 0 10])
    set(gca,'xticklabel',[], 'yticklabel',[]) 

    state = 1;
    visited_states = [];
    n = 0;
    while( state ~= 100 && n < 100)
        [y,x] = ind2sub([10,10],state);
        visited_states = [visited_states state];
        if optim_pol(state) == 1
            text(x - 0.5, 10 - y + 0.5, '\^')
            state = state - 1;
        elseif optim_pol(state) == 2
            text(x - 0.5, 10 - y + 0.5, '>')
            state = state + 10;
        elseif optim_pol(state) == 3
            text(x - 0.5, 10 - y + 0.5, 'v')
            state = state + 1;
        else
            text(x - 0.5, 10 - y + 0.5, '<')
            state = state - 10;
        end

        n = n + 1;

    end

    text(0.35,9.25, '*', 'color', 'blue', 'FontSize', 30);
    text(9.35,0.25, '*','color', 'red', 'FontSize', 30);

    visited_states = [visited_states 100];
end