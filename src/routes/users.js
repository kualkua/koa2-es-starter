import Router from 'koa-router';

const router = Router({
    prefix: '/users',
});

router.get('/', (ctx) => {
    ctx.body = 'this is a users response!';
});

router.get('/bar', (ctx) => {
    ctx.body = 'this is a users/bar response';
});

export default router;
