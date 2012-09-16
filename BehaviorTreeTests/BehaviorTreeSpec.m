#import "Kiwi.h"
#import "BehaviorTree.h"

SPEC_BEGIN(BehaviorTreeSpec)

describe(@"BehaviorTree", ^{
    context(@"when run", ^{
        __block BehaviorTree *tree;
        __block id task;
        
        beforeEach(^{
            task = [KWMock nullMockForProtocol:@protocol(Task)];
            tree = [[BehaviorTree alloc] initWithRootTask:task];
        });

        it(@"should start root task", ^{
            [[task should] receive:@selector(start)];
            [tree run];
        });
        
        it(@"should run root task", ^{
            [[task should] receive:@selector(run:)];
            [tree run];
        });
        
        it(@"should stop root task", ^{
            [[task should] receive:@selector(stop)];
            [tree run];
        });
    });
});

SPEC_END