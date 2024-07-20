#ifndef FFM_H
#define FFM_H

typedef struct
{
    unsigned char rejectedBottles;
    unsigned char acceptedBottles;
} FFM;

void initFFM(FFM *ffm);
void runFFM(FFM *ffm);
void incrementRejectedBottles(FFM *ffm);
void incrementAcceptedBottles(FFM *ffm);

#endif // FFM_H
