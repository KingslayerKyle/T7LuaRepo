-- 66f4f6b071a44e0a1bfe4090d82b2fda
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_Pip = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_Pip.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_Pip )
	self.id = "BM_Contracts_Pip"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Pipempty = LUI.UIImage.new()
	Pipempty:setLeftRight( true, true, -8, 8 )
	Pipempty:setTopBottom( true, true, -7, 9 )
	Pipempty:setScale( 1.2 )
	Pipempty:setImage( RegisterImage( "uie_t7_bm_contracts_pip_empty" ) )
	self:addElement( Pipempty )
	self.Pipempty = Pipempty
	
	local Pip = LUI.UIImage.new()
	Pip:setLeftRight( true, true, -8, 8 )
	Pip:setTopBottom( true, true, -7, 9 )
	Pip:setScale( 1.2 )
	Pip:setImage( RegisterImage( "uie_t7_bm_contracts_pip_full" ) )
	self:addElement( Pip )
	self.Pip = Pip
	
	local PipCompleted = LUI.UIImage.new()
	PipCompleted:setLeftRight( true, true, -8, 8 )
	PipCompleted:setTopBottom( true, true, -7, 9 )
	PipCompleted:setAlpha( 0 )
	PipCompleted:setScale( 1.2 )
	PipCompleted:setImage( RegisterImage( "uie_t7_bm_contracts_pip_completed_" ) )
	self:addElement( PipCompleted )
	self.PipCompleted = PipCompleted
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Pipempty:completeAnimation()
				self.Pipempty:setAlpha( 1 )
				self.clipFinished( Pipempty, {} )

				Pip:completeAnimation()
				self.Pip:setRGB( 1, 1, 1 )
				self.Pip:setAlpha( 0 )
				self.clipFinished( Pip, {} )

				PipCompleted:completeAnimation()
				self.PipCompleted:setAlpha( 0 )
				self.clipFinished( PipCompleted, {} )
			end
		},
		AllComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Pipempty:completeAnimation()
				self.Pipempty:setAlpha( 0 )
				self.clipFinished( Pipempty, {} )

				Pip:completeAnimation()
				self.Pip:setRGB( 1, 1, 1 )
				self.Pip:setAlpha( 0 )
				self.clipFinished( Pip, {} )

				PipCompleted:completeAnimation()
				self.PipCompleted:setAlpha( 1 )
				self.clipFinished( PipCompleted, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Pipempty:completeAnimation()
				self.Pipempty:setAlpha( 0 )
				self.clipFinished( Pipempty, {} )

				Pip:completeAnimation()
				self.Pip:setRGB( 1, 1, 1 )
				self.Pip:setAlpha( 1 )
				self.clipFinished( Pip, {} )

				PipCompleted:completeAnimation()
				self.PipCompleted:setAlpha( 0 )
				self.clipFinished( PipCompleted, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

