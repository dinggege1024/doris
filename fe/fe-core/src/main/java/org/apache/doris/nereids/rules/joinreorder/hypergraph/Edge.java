// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

package org.apache.doris.nereids.rules.joinreorder.hypergraph;

import org.apache.doris.nereids.rules.joinreorder.hypergraph.bitmap.Bitmap;
import org.apache.doris.nereids.trees.plans.GroupPlan;
import org.apache.doris.nereids.trees.plans.Plan;
import org.apache.doris.nereids.trees.plans.logical.LogicalJoin;

import java.util.BitSet;

/**
 * Edge in HyperGraph
 */
public class Edge {
    final int index;
    final LogicalJoin join;
    final double selectivity;

    // The endpoints (hyperNodes) of this hyperEdge.
    // left and right may not overlap, and both must have at least one bit set.
    private BitSet left = Bitmap.newBitmap();
    private BitSet right = Bitmap.newBitmap();

    /**
     * Create simple edge.
     */
    public Edge(LogicalJoin join, int index) {
        this.index = index;
        this.join = join;
        this.selectivity = 1.0;
    }

    public LogicalJoin getJoin() {
        return join;
    }

    public boolean isSimple() {
        return Bitmap.getCardinality(left) == 1 && Bitmap.getCardinality(right) == 1;
    }

    public void addLeftNode(BitSet left) {
        Bitmap.or(this.left, left);
    }

    public void addLeftNodes(BitSet... bitSets) {
        for (BitSet bitSet : bitSets) {
            Bitmap.or(this.left, bitSet);
        }
    }

    public void addRightNode(BitSet right) {
        Bitmap.or(this.right, right);
    }

    public void addRightNodes(BitSet... bitSets) {
        for (BitSet bitSet : bitSets) {
            Bitmap.or(this.right, bitSet);
        }
    }

    public BitSet getLeft() {
        return left;
    }

    public void setLeft(BitSet left) {
        this.left = left;
    }

    public BitSet getRight() {
        return right;
    }

    public void setRight(BitSet right) {
        this.right = right;
    }

    public boolean isSub(Edge edge) {
        // When this join reference nodes is a subset of other join, then this join must appear before that join
        BitSet bitSet = getReferenceNodes();
        BitSet otherBitset = edge.getReferenceNodes();
        return Bitmap.isSubset(bitSet, otherBitset);
    }

    public BitSet getReferenceNodes() {
        return Bitmap.newBitmapUnion(this.left, this.right);
    }

    public Edge reverse(int index) {
        Edge newEdge = new Edge(join, index);
        newEdge.addLeftNode(right);
        newEdge.addRightNode(left);
        return newEdge;
    }

    public int getIndex() {
        return index;
    }

    public double getSelectivity() {
        return selectivity;
    }

    private double getRowCount(Plan plan) {
        if (plan instanceof GroupPlan) {
            return ((GroupPlan) plan).getGroup().getStatistics().getRowCount();
        }
        return plan.getGroupExpression().get().getOwnerGroup().getStatistics().getRowCount();
    }

    @Override
    public String toString() {
        return String.format("<%s - %s>", left, right);
    }
}

