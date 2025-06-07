define hierarchy z363_14_lgl
  as parent child hierarchy(
    source Z363_13_LGL_c
    child to parent association _Manager
    start where
      Manager is initial
    siblings order by
      Employee
    multiple parents allowed
    orphans ignore
    cycles breakup cache on
  )
{
  key Employee,
      Manager,
      Name,
      $node.parent_id           as ParentId,
      $node.hierarchy_level     as HLevel,
      $node.hierarchy_tree_size as HSize,
      $node.hierarchy_is_orphan as HOrphan
      // $node all the ather variables available

}
