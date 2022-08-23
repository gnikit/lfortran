#include <libasr/pass/pass_utils.h>

namespace LFortran
{

namespace ASR
{
    template <class Derived>
    class StatementWalkVisitor : public PassUtils::PassVisitor<Derived>
    {
    public:
        StatementWalkVisitor(Allocator& al_)
            : PassUtils::PassVisitor<Derived>(al_, nullptr)
        {
        }

        void visit_WhileLoop(const ASR::WhileLoop_t& x)
        {
            // FIXME: this is a hack, we need to pass in a non-const `x`,
            // which requires to generate a TransformVisitor.
            ASR::WhileLoop_t& xx = const_cast<ASR::WhileLoop_t&>(x);
            PassUtils::PassVisitor<Derived>::transform_stmts(xx.m_body, xx.n_body);
        }

        void visit_DoLoop(const ASR::DoLoop_t& x)
        {
            // FIXME: this is a hack, we need to pass in a non-const `x`,
            // which requires to generate a TransformVisitor.
            ASR::DoLoop_t& xx = const_cast<ASR::DoLoop_t&>(x);
            PassUtils::PassVisitor<Derived>::transform_stmts(xx.m_body, xx.n_body);
        }
    };
}  // namespace ASR

}  // namespace LFortran
